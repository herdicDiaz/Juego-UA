use aprender;


-- eliminar el padre y los hijos (Menu - dinamico)

DELIMITER //
create procedure eliminar_menu_padreHijo(in id_padre int)
begin
declare numero_vista_dis int default 0;
declare id_vista_desact int default 0;

ciclo_act: LOOP

set numero_vista_dis = (select count(id_vista) from vista where fk_master =id_padre and estado='activo');

set id_vista_desact= (select id_vista from vista where fk_master =id_padre and estado='activo' limit 1);
                   
if	numero_vista_dis is not null then
-- actualizar 
if numero_vista_dis > 0 then
      update vista set estado='D' where id_vista =id_vista_desact;
else
     LEAVE ciclo_act;
end if;
end if;
 END LOOP ciclo_act;
END//
-- call eliminar_menu_padreHijo('1');










