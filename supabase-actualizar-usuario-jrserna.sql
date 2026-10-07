-- Ejecuta esto en Supabase → SQL → New query → Run
-- Requisito: el usuario ya debe existir (Authentication → Users) con email jrserna@ignaser.es
-- Si aún no lo creaste, créalo con contraseña y luego ejecuta esto.
--
-- Asigna nombre y rol para la app (name + role; role Admin = acceso completo al inventario)

update auth.users
set
  raw_user_meta_data = coalesce(raw_user_meta_data, '{}'::jsonb)
    || jsonb_build_object(
      'name', 'J. R. Serna',
      'role', 'Admin'
    )
where email = 'jrserna@ignaser.es';

-- Comprueba que se actualizó (debe mostrar 1 fila con role y name):
-- select id, email, raw_user_meta_data from auth.users where email = 'jrserna@ignaser.es';
