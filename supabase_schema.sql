-- Illustrative Supabase/Postgres schema for a later production phase.
-- Do not run this until you have created a Supabase project and reviewed the policies.
-- This schema is not connected to the static starter website.

create extension if not exists pgcrypto;

create table if not exists public.businesses (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  category text,
  notes text,
  created_at timestamptz not null default now()
);

create table if not exists public.ai_requests (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references auth.users(id) on delete cascade,
  business_id uuid references public.businesses(id) on delete set null,
  department text not null,
  request_text text not null,
  status text not null default 'pending_approval'
    check (status in ('pending_approval','approved','declined','executing','completed','failed','cancelled')),
  created_at timestamptz not null default now(),
  reviewed_at timestamptz,
  reviewed_by uuid references auth.users(id)
);

create table if not exists public.approval_events (
  id uuid primary key default gen_random_uuid(),
  request_id uuid not null references public.ai_requests(id) on delete cascade,
  owner_id uuid not null references auth.users(id) on delete cascade,
  decision text not null check (decision in ('approved','declined','revoked')),
  action_snapshot jsonb not null,
  created_at timestamptz not null default now()
);

alter table public.businesses enable row level security;
alter table public.ai_requests enable row level security;
alter table public.approval_events enable row level security;

create policy "Owners manage their own businesses"
on public.businesses for all
using (auth.uid() = owner_id)
with check (auth.uid() = owner_id);

create policy "Owners manage their own requests"
on public.ai_requests for all
using (auth.uid() = owner_id)
with check (auth.uid() = owner_id);

create policy "Owners read their own approval events"
on public.approval_events for select
using (auth.uid() = owner_id);

-- Important:
-- Do not allow browser clients to insert an "approved" event and execute an action directly.
-- A trusted server endpoint must validate the authenticated owner, exact action snapshot,
-- request status, expiry, and permissions before any external execution.
