# Security, Approval Design and Production Roadmap

## Non-negotiable operating rule

The owner has selected: **the AI must ask before every action**.

Treat all AI output as a proposal, not an instruction to execute. The system must not carry out an external action until the authenticated owner approves that exact action.

## Approval record should contain

- Proposal ID
- Requesting AI department
- Plain-language description of the action
- Exact target (for example, recipient, platform or account)
- Exact content or change to be made
- Cost, currency and spending limit, if applicable
- Risks and relevant assumptions
- Created time and expiry time
- Owner identity and approval time
- Execution status and result

Any material change to the action after approval must create a new proposal and require approval again.

## Recommended phases

### Phase 1 — Foundation
- Owner authentication
- Database and backups
- Multi-device synchronization
- Audit log
- Role-based access control

### Phase 2 — AI CEO
- Server-side model integration
- Department routing
- Structured proposals
- Approval queue
- Clear refusal/error states

### Phase 3 — Specialist departments
- Finance: read-only records and draft reports first
- Marketing: draft campaigns; publishing requires approval
- HR: draft job descriptions and workflows; human hiring decisions
- Customer Support: draft replies; sending requires approval
- Operations: task plans and status tracking

### Phase 4 — Carefully controlled integrations
- Email and calendar
- Website/CMS
- Customer support platform
- Accounting software
- Social media tools

Add one integration at a time. Use minimum permissions and test accounts first.

## Security requirements

- Never expose provider API keys in `app.js`, HTML or other browser files.
- Use server-side secrets/environment variables.
- Enable database Row Level Security and test policies.
- Require authenticated owner identity for approval and execution endpoints.
- Validate every request on the server; never trust a browser button alone.
- Log who proposed, approved and executed each action.
- Add rate limits, backups, monitoring and recovery procedures.
- Do not automate bank transfers, hiring/firing, legal filings or other high-impact decisions without appropriate human and professional oversight.

## Budget note

This starter package can be run locally at no software cost. Hosting, custom domain, database usage and AI API usage may incur charges as the project grows. Check current provider pricing before enabling paid services. Keep API spending limits low and alerts enabled.
