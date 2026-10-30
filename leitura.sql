-- Rode no Supabase: SQL Editor > New query > Run
-- Cria o perfil "leitor": pode ver tudo, mas não pode criar, editar nem apagar.

drop policy if exists "logados" on clientes;
drop policy if exists "logados" on produtos;
drop policy if exists "logados" on pedidos;
drop policy if exists "logados" on itens_pedido;

create policy "ler" on clientes for select to authenticated using (true);
create policy "ler" on produtos for select to authenticated using (true);
create policy "ler" on pedidos for select to authenticated using (true);
create policy "ler" on itens_pedido for select to authenticated using (true);

create policy "gravar" on clientes for all to authenticated
  using ((auth.jwt()->'app_metadata'->>'papel') is distinct from 'leitor')
  with check ((auth.jwt()->'app_metadata'->>'papel') is distinct from 'leitor');
create policy "gravar" on produtos for all to authenticated
  using ((auth.jwt()->'app_metadata'->>'papel') is distinct from 'leitor')
  with check ((auth.jwt()->'app_metadata'->>'papel') is distinct from 'leitor');
create policy "gravar" on pedidos for all to authenticated
  using ((auth.jwt()->'app_metadata'->>'papel') is distinct from 'leitor')
  with check ((auth.jwt()->'app_metadata'->>'papel') is distinct from 'leitor');
create policy "gravar" on itens_pedido for all to authenticated
  using ((auth.jwt()->'app_metadata'->>'papel') is distinct from 'leitor')
  with check ((auth.jwt()->'app_metadata'->>'papel') is distinct from 'leitor');

-- Depois de criar o usuário da sua mãe em Authentication > Users,
-- troque o e-mail abaixo pelo dela e rode esta parte:
update auth.users
set raw_app_meta_data = coalesce(raw_app_meta_data,'{}'::jsonb) || '{"papel":"leitor"}'::jsonb
where email = 'EMAIL_DA_SUA_MAE@exemplo.com';
