insert into reconcileddatalayer.dbo.municipalities (id, name, province, region, istat, finance)
select
	c.comuni_id,
	cast(c.NomeComune as nvarchar(50)),
	cast(c.Provincia as nvarchar(2)),
	cast(c.CodiceRegione as int),
	c.CodiceIstat,
	c.CodiceFinanze
from contitravel.dbo.comuni as c
where not exists (
	select 1
	from reconcileddatalayer.dbo.municipalities as rdl
	where rdl.id = c.Comuni_id
);