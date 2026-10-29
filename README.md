# Bananadas · Controle de vendas (Vercel + Supabase)

## 1. Banco de dados (Supabase)
1. Crie uma conta em supabase.com e um projeto novo (guarde a senha do banco).
2. Menu **SQL Editor** > New query > cole o conteúdo de `schema.sql` > **Run**.
3. Menu **Authentication > Sign In / Providers > Email**: desligue **Confirm email**.
4. Menu **Authentication > Users > Add user > Create new user**: cadastre seu e-mail e uma senha (repita para cada pessoa que for usar o app).
5. Depois de cadastrar todos, volte em Sign In / Providers e desligue **Allow new users to sign up**. Assim ninguém de fora cria conta.
6. Menu **Project Settings > API**: copie a **Project URL** e a chave **anon public**.
7. Abra `config.js` e cole os dois valores.

## 2. Hospedagem (Vercel)
**Opção A, pelo terminal (mais rápida):**
```
npm i -g vercel
cd bananadas-vercel
vercel          # responda às perguntas (Framework: Other)
vercel --prod   # publica de verdade
```
**Opção B, pelo GitHub:** envie esta pasta para um repositório, entre em vercel.com/new, importe o repositório, deixe o Framework em "Other", sem comando de build, e clique em Deploy.

Pronto: a Vercel devolve um link. No celular, abra o link e use "Adicionar à tela inicial".

## Arquivos
- `index.html`: o app
- `config.js`: URL e chave do Supabase
- `schema.sql`: tabelas e regras de segurança
