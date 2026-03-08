insert into reconcileddatalayer.dbo.provinces (code, name, region, capital, municipalities)
select
	cast(case when p.prov_cod = 'FERMO' then 'FM' else p.prov_cod end as nvarchar(2)),
	cast(p.prov_desc as nvarchar(20)),
	cast(p.prov_reg as nvarchar(2)),
	cast(case when p.prov_capoluogo = 'C' then 1 else 0 end as bit),
	cast(p.prov_ncomuni as int)
from meridiano.dbo.province as p
where not exists (
	select 1
	from reconcileddatalayer.dbo.provinces as rdl
	where rdl.code = p.prov_cod
);