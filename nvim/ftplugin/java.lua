-- helper function for checking if a table contains a value
local function contains(table, value)
    for _, table_value in ipairs(table) do
        if table_value == value then
            return true
        end
    end

    return false
end

-- gathers all of the bemol-generated files and adds them to the LSP workspace
local function bemol()
    local bemol_dir = vim.fs.find({ ".bemol" }, { upward = true, type = "directory" })[1]
    local ws_folders_lsp = {}
    if bemol_dir then
        local file = io.open(bemol_dir .. "/ws_root_folders", "r")
        if file then
            for line in file:lines() do
                table.insert(ws_folders_lsp, line)
            end
            file:close()
        end

        for _, line in ipairs(ws_folders_lsp) do
            if not contains(vim.lsp.buf.list_workspace_folders(), line) then
                vim.lsp.buf.add_workspace_folder(line)
            end
        end
    end
end

local jdtls = require "jdtls"
local jdtls_setup = require "jdtls.setup"

local home = os.getenv("HOME")
local root_markers = { ".bemol", }
local root_dir = jdtls_setup.find_root(root_markers)
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name
local path_to_mason = home .."/.local/share/nvim/mason"
local path_to_jdtls = path_to_mason .. "/packages/jdtls"
local os_type = vim.fn.has("macunix") and "mac" or "linux"
local path_to_config = path_to_jdtls .. "/config_" .. os_type
local path_to_lombok = path_to_mason .. "/share/jdtls/lombok.jar"
local path_to_plugins = path_to_jdtls .. "/plugins/"
-- the eclipse jar is suffixed with a bunch of version nonsense, so we find it by pattern matching
local path_to_jar = vim.fs.find(function(name, _)
  return name:match('org.eclipse.equinox.launcher_.*')
end, { path = path_to_plugins, type = 'file' })[1]

-- The latest version of jdtls requires at least Java 21. If your project is not upgraded to Java 21+, uncomment this line and point to your JDK/Contents/Home. This will not affect your builds, only vim.
-- vim.uv.os_setenv("JAVA_HOME",  "/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home")


local config = {
    cmd = {
        -- assumes the java binary is in your PATH and at least java17;
        -- if not, specify the full path to the binary
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "-javaagent:" .. path_to_lombok,
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        "-jar",
        path_to_jar,

        "-configuration",
        path_to_config,

        "-data",
        workspace_dir,
    },

    root_dir = root_dir,

    capabilities = {
        workspace = {
            configuration = true
        },
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true
                }
            }
        }
    },

    settings = {
        java = {
            references = {
                includeDecompiledSources = true,
            },
            eclipse = {
                downloadSources = true,
            },
            maven = {
                downloadSources = true,
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
        }
    },

    -- run our bemol function when the LSP attaches to the buffer
    on_attach = bemol,
}

jdtls.start_or_attach(config)
