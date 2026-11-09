-- Supabase SQL Editorで実行してください
create table if not exists public.user_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{"required":124,"subjects":[],"goals":{}}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.user_data enable row level security;
create policy "Users can read their own data"
on public.user_data for select to authenticated
using (auth.uid() = user_id);
create policy "Users can insert their own data"
on public.user_data for insert to authenticated
with check (auth.uid() = user_id);
create policy "Users can update their own data"
on public.user_data for update to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);
