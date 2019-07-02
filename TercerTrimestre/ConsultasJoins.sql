/** Consultas **/
select count(m.id), tm.Descripcion from Material as m
join tipomaterial as tm on m.IdTipoMaterial=tm.Id
group by IdTipoMaterial;


select  s.idMaterial, m.color,m.IdTextura as'Textura',  m.idproveedor, tm.Descripcion from detallessalida as s
join material as m on s.idMaterial=m.Id
join TipoMaterial as tm on m.IdTipoMaterial=tm.Id 
group by s.IdMaterial
order by s.idMaterial asc limit 3
;
 
 
select s.*,ds.* from salida as s
join detallessalida as ds on ds.idSalida=s.Id; 


select count(m.id) as 'No. Materiales', p.Nombre, p.PaisOrigen from material as m 
join proveedor as p on m.IdProveedor=p.Id
group by p.Id  having p.PaisOrigen<>'Colombia';


select count(m.id) as 'No. Materiales', p.Nombre, p.PaisOrigen from material as m 
join proveedor as p on m.IdProveedor=p.Id
group by p.Id  having p.PaisOrigen='Colombia';


select m.id, tm.Descripcion, m.IdProveedor, p.Nombre from material as m
join TipoMaterial as tm on m.IdTipoMaterial=tm.Id
join proveedor as p on m.IdProveedor=p.ID
where p.PaisOrigen<>'Colombia';

select m.id, tm.Descripcion, m.IdProveedor, p.Nombre from material as m
join TipoMaterial as tm on m.IdTipoMaterial=tm.Id
join proveedor as p on m.IdProveedor=p.ID
where p.PaisOrigen='Colombia';

select count(m.id) as Cantidad , tm.Descripcion as TipoMaterial from Material as m
join tipomaterial as tm on m.IdTipoMaterial=tm.Id group by IdTipoMaterial; 


 
 