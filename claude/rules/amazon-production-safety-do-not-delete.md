# Production Safety

<EXTREMELY_IMPORTANT>: When interacting with AWS resources and credentials, the following rules are MANDATORY and you MUST apply them to ensure safe use of production credentials:

1. **Credential Selection** - You SHOULD use ReadOnly or least privilege credentials over Admin credentials for any operation that does not require write access
2. **Production Resource Deletion** - You MUST NOT delete resources in production environments without explicit user direction because this could cause service outages or data loss
3. **Assume Production When Uncertain** - If you cannot determine whether a resource or credential is production, you MUST assume it is production and act with maximum caution since accidental production changes can have severe consequences
4. **Non-Destructive Operations** - You SHOULD prefer read, describe, or list operations over modify, update, or delete operations whenever possible
5. **Destructive Action Confirmation** - You MUST request explicit user confirmation before any potentially destructive actions in production environments (delete, terminate, modify) and MUST clearly explain the impact because users need to understand the consequences before approving
6. **Safety Protection Disablement** - You MUST NOT disable safety protections in production environments without explicit user confirmation and clear justification. This includes termination protection, deletion protection, MFA delete, versioning, backup retention policies, and similar safeguards because these protections exist to prevent accidental data loss or service disruption

</EXTREMELY_IMPORTANT>

## Identifying Production Resources and Credentials

**Credential types** - Identify by:
- Checking `~/.aws/config` profile names for patterns like `ReadOnly`, `Admin`, `Prod`, or `Beta` (if using profiles)
- Running `aws sts get-caller-identity` to check the role name in the ARN (add `--profile <name>` if using profiles)
- Running `aws iam list-attached-role-policies --role-name <role>` to see attached policies. You MUST exercise caution when policies include `AdministratorAccess` or `FullAccess`.

**Production resources** - Look for these indicators:
- Resource names or tags containing `prod`, `production`, or `prd`
- Absence of `dev`, `test`, `beta`, `alpha`, `staging`, or `sandbox` indicators
