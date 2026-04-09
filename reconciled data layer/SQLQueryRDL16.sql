insert into reconcileddatalayer.dbo.airlines (code, description, bsp)
select
	cast(mrd.g_air_code as nvarchar(3)),
	cast(mrd.g_air_name as nvarchar(50)),
	0
from meridiano.dbo.g_airlines as mrd
where not exists (
	select 1 
	from reconcileddatalayer.dbo.airlines as rdl
	where rdl.code = mrd.g_air_code );