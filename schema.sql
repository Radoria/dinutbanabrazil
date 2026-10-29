-- Cole este script inteiro no Supabase: SQL Editor > New query > Run

create table clientes (
  id uuid primary key default gen_random_uuid(),
  nome text not null,
  cnpj text,
  endereco text,
  criado_em timestamptz not null default now()
);

create table produtos (
  id uuid primary key default gen_random_uuid(),
  nome text not null,
  unidade text not null default 'un',
  valor numeric(12,2) not null check (valor >= 0),
  criado_em timestamptz not null default now()
);

create table pedidos (
  id uuid primary key default gen_random_uuid(),
  cliente_id uuid references clientes(id) on delete set null,
  cliente_nome text not null,
  total numeric(12,2) not null,
  criado_em timestamptz not null default now()
);

create table itens_pedido (
  id uuid primary key default gen_random_uuid(),
  pedido_id uuid not null references pedidos(id) on delete cascade,
  produto_nome text not null,
  unidade text,
  quantidade numeric(12,3) not null check (quantidade > 0),
  valor_unitario numeric(12,2) not null check (valor_unitario >= 0)
);

-- Segurança: só usuários logados leem e gravam
alter table clientes enable row level security;
alter table produtos enable row level security;
alter table pedidos enable row level security;
alter table itens_pedido enable row level security;

create policy "logados" on clientes for all to authenticated using (true) with check (true);
create policy "logados" on produtos for all to authenticated using (true) with check (true);
create policy "logados" on pedidos for all to authenticated using (true) with check (true);
create policy "logados" on itens_pedido for all to authenticated using (true) with check (true);
