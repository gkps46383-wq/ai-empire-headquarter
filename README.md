# AI Empire Headquarters — Starter Package

An English-language, responsive starter website for an owner-controlled, AI-managed multi-business group.

## What is included

- Responsive dashboard for mobile, tablet and desktop
- Overview and six department briefs: AI CEO, Finance, Marketing, Human Resources, Customer Support and Operations
- Approval Center
- Business register
- Task/request register
- Basic reports and JSON backup export
- Local browser storage
- Approval-first product language and workflow

## Important: what this version does and does not do

This is a **front-end starter prototype**, not a fully deployed autonomous company platform.

- It does not connect to a live AI model or OpenAI API.
- It does not have secure owner authentication or multi-user access.
- It does not connect to email, WhatsApp, banking, payment gateways, accounting tools or social media.
- Data is stored in the current browser on the current device. It does not automatically sync across devices.
- The Approve button records your decision in this prototype; it does not execute the requested action.
- Do not store confidential, financial, customer or employee data in this prototype.
- Never put a private API key in browser-side JavaScript.

## Run locally

1. Extract the ZIP file.
2. Open the `index.html` file in a modern browser (Chrome, Edge, Firefox or Safari).
3. Use the sidebar to explore the dashboard.
4. Add a request or business record. Data is saved in that browser.

No build tools or installation are required for the static prototype.

## Publish as a website

You can deploy the contents of this folder to a static hosting provider such as Vercel, Netlify or GitHub Pages. Create an account with the provider, import/upload this project, and publish it.

Before using it for real company operations, add:
1. Secure authentication and owner-only authorization.
2. A server-side database with access policies and backups.
3. A server-side AI integration; keep API keys on the server.
4. An approval workflow that binds each approval to a specific action, amount, recipient and expiry.
5. Audit logs, error handling, rate limits and notification delivery.
6. Human review and legal/accounting checks for regulated or high-impact actions.

Free hosting/database tiers and provider limits can change. Check the provider's current pricing and terms before deploying.

## Suggested next technical phase

Recommended architecture for a production version:

- Frontend: this responsive web app, later migrated to a maintainable framework if needed.
- Authentication and database: Supabase (Auth + Postgres + Row Level Security).
- Hosting: Vercel or Netlify.
- AI: server-side API route calling the selected model provider.
- Workflow: every AI proposal creates a pending approval record. A separate server endpoint validates the owner's authenticated approval before carrying out an allowed action.
- Audit: append-only records for proposals, approvals, execution results and failures.

## Folder structure

```text
ai-empire-headquarters/
├── index.html
├── styles.css
├── app.js
├── README.md
├── DEPLOYMENT_GUIDE.md
├── SECURITY_AND_ROADMAP.md
└── database/
    └── supabase_schema.sql
```
