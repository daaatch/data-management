insert into reconcileddatalayer.dbo.accommodations (code, name, description)
select
	cast(sis.sistemazione_cod as nvarchar(16)),
	cast(sis.sistemazione_desridotta as nvarchar(25)),
	cast(sis.sistemazione_des as nvarchar(50))
from meridiano.dbo.sistemazione as sis