# Amazon Internal Development Systems

Documentation for all major Amazon internal systems can be found on the Amazon Software Builder Experience (ASBX) [docs pages](https://docs.hub.amazon.dev/). However, the most important basic systems to know about are:

1. [Brazil](https://docs.hub.amazon.dev/brazil/) - The Brazil Build System is the code management system and build tool used at Amazon. It encompasses a number of different concepts in the software world including compiling, versioning, dependency management, build reproducibility, artifact sharing, and artifact storage.
1. [CRUX](https://docs.hub.amazon.dev/crux/) - CRUX allows you to create code reviews using the cr command in a Brazil project and to review code within Code Browser.
1. [Coral](https://docs.hub.amazon.dev/coral/) - Coral is a service framework written by the AWS Coral team. It powers everything from public AWS services to the internal services that enable Alexa and the Retail Website. Coral allows clients and servers written in different programming languages to reliably talk to each other while evolving compatibly. If you are looking to build an RPC or REST service, Coral is probably the right choice for you.
1. [Apollo](https://docs.hub.amazon.dev/apollo/) - Apollo is an internal deployment service that enables you to deploy software to target hosts, Apollo containers, or AWS compute types such as EC2 and Lambda. Apollo is a part of the Deploy software development process category.
1. [Pipelines](https://docs.hub.amazon.dev/pipelines/) - Pipelines is a Continuous deployment tool you can use to model, visualize, and automate the steps required to release your software. It provides a web interface, API, CLI, and Cloud Development Kit (CDK) constructs to give you the ability to quickly design and configure the different stages of your release process.
1. [Taskei](https://w.amazon.com/bin/view/Taskei/User-Guide/) - Taskei is Amazon's modern task and project management system. It provides comprehensive project tracking, sprint management, kanban boards, and workflow capabilities for managing development work across teams. Used for tracking any task-related progress including links to design docs or feature requirement docs, collecting status updates when CRs are associated, and marking tasks as blocked when dependencies require attention.
1. [BuilderHub](https://docs.hub.amazon.dev/builderhub/) - BuilderHub is Amazon Software Builder Experience (ASBX)'s information, documentation, application-creation, package-creation, and Cloud Desktop-creation portal, serving all Amazon developers with the tools and information they need to build great software at Amazon.
1. [AWS CX Builder Hub](https://hub.cx.aws.dev/) - AWS CX Builder Hub is Amazon Software Builder Experience's (ASBX)'s specialized portal designed specifically for AWS Customer Experience (AWSCX) teams. It serves as a centralized platform where internal AWS builders can find all the services, tools, and guidance needed to build, test, launch, and measure the impact of their AWS experiences like console interfaces and widgets.

# Inclusive Language

Avoid non-inclusive terms in all code, comments, and documentation:

| Don't use | Use instead |
|---|---|
| master | primary, main, leader, controller |
| slave | replica, secondary, follower, responder |
| whitelist | allowlist, approved list, inclusion list |
| blacklist | denylist, blocklist, exclusion list |
| whiteday(s) | clear day(s), allowed day(s) |
| blackday(s) | blocked day(s) |
