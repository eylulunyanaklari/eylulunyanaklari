-- Yanak Defteri: Supabase başlangıç şeması (henüz bağlanmamıştır)
-- ÖNEMLİ: Şema tek başına uygulamayı internete açmaz. Supabase projesi, Auth,
-- RLS politikaları ve istemci entegrasyonu ayrıca yapılandırılmalıdır.
create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null,
  role text not null check (role in ('admin','viewer')),
  created_at timestamptz not null default now()
);

create table if not exists public.daily_records (
  record_date date primary key,
  scores jsonb not null default '{}'::jsonb,
  complete boolean not null default false,
  note text not null default '',
  updated_at timestamptz not null default now()
);

create table if not exists public.yanak_transactions (
  id uuid primary key default gen_random_uuid(),
  record_date date not null,
  amount integer not null check (amount <> 0),
  transaction_time time not null default localtime,
  note text not null default '',
  created_at timestamptz not null default now()
);

create table if not exists public.categories (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  position integer not null default 0,
  active boolean not null default true
);

create table if not exists public.goals (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  target integer not null check (target > 0),
  goal_type text not null check (goal_type in ('balance','period')),
  start_date date,
  end_date date,
  description text not null default '',
  reward text not null default '',
  deadline date,
  status text not null default 'active' check (status in ('active','done','cancel')),
  created_at timestamptz not null default now()
);

create table if not exists public.private_notes (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  body text not null,
  note_date date not null default current_date,
  created_at timestamptz not null default now()
);

-- Enable Row Level Security. Do not add broad anon write policies.
alter table public.profiles enable row level security;
alter table public.daily_records enable row level security;
alter table public.yanak_transactions enable row level security;
alter table public.categories enable row level security;
alter table public.goals enable row level security;
alter table public.private_notes enable row level security;

-- Recommended next step: create two Supabase Auth users, assign Eylül role='admin'
-- and Şahan role='viewer' in profiles. Then add policies that permit authenticated
-- users to SELECT shared records, but permit INSERT/UPDATE/DELETE only when
-- profiles.role = 'admin'. Keep private_notes SELECT limited to the intended users.
-- This starter intentionally avoids permissive policies until project/user IDs exist.
