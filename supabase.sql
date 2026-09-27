-- VentLab OS v3 — bulut sinxronizatsiya jadvali
-- Supabase Dashboard → SQL Editor ga joylab RUN bosing.
create table if not exists public.lab_state (
  id          int primary key default 1 check (id = 1),
  data        text not null,               -- AES-GCM shifrlangan JSON (E2E)
  iv          text not null,               -- b64b64 iv
  updated_at  bigint not null,             -- Date.now()
  updated_by  text not null default '?'    -- kim o'zgartirdi
);
alter table public.lab_state enable row level security;
drop policy if exists "lab_rw_auth" on public.lab_state;
create policy "lab_rw_auth" on public.lab_state
  for all to authenticated
  using (true)
  with check (true);
-- (anon rol uchun hech qanday policy yo'q — faqat login qilganlar ko'radi/yozadi)

-- REAL-TIME kanalga qo'shish (doimiy sinxron uchun SHART):
alter publication supabase_realtime add table public.lab_state;
-- (agar "already a member of publication" desa — demak allaqachon qo'shilgan, xato emas)
