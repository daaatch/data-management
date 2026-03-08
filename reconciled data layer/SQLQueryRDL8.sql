insert into reconcileddatalayer.dbo.currencies (code, description)
select 
	cast(v.valuta_cod as nvarchar(3)),
	cast(v.valuta_des as nvarchar(50))
from contitravel.dbo.valuta as v
where not exists (
	select 1
	from reconcileddatalayer.dbo.currencies as rdl
	where rdl.code = v.valuta_cod );