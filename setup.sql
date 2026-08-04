create extension if not exists pgcrypto;
create table if not exists public.plant_entries(
id uuid primary key default gen_random_uuid(),created_at timestamptz not null default now(),
english_name text not null,german_name text,scientific_name text,place text not null,
latitude double precision not null,longitude double precision not null,image_url text,
noticed_on date not null,story text not null,meaning text not null,author text not null,
status text not null default 'pending' check(status in('pending','returned','approved')));
alter table public.plant_entries enable row level security;
create policy "Anyone can read approved entries" on public.plant_entries for select to anon,authenticated using(status='approved' or auth.jwt()->>'email'='REPLACE_WITH_YOUR_TEACHER_EMAIL');
create policy "Anyone can submit pending entries" on public.plant_entries for insert to anon,authenticated with check(status='pending');
create policy "Teacher can update entries" on public.plant_entries for update to authenticated using(auth.jwt()->>'email'='REPLACE_WITH_YOUR_TEACHER_EMAIL') with check(auth.jwt()->>'email'='REPLACE_WITH_YOUR_TEACHER_EMAIL');
create policy "Teacher can delete entries" on public.plant_entries for delete to authenticated using(auth.jwt()->>'email'='REPLACE_WITH_YOUR_TEACHER_EMAIL');