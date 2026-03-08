insert into ReconciledDataLayer.dbo.regions (code, name, country, provinces, municipalities, istat)
select
	cast(r.REGIONI_COD as nvarchar(6)),
	cast(r.REGIONI_DESC as nvarchar(50)),
	cast(r.REGIONI_NAZ as nvarchar(3)),
	cast(r.REGIONI_NPROVINCIE as int),
	cast(r.REGIONI_NCOMUNI as int),
	cast(r.REGIONI_ISTAT as nvarchar(2))
from meridiano.dbo.regioni as r
