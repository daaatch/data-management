insert into reconcileddatalayer.dbo.services (id, code, description)
select m.servizi_id,
cast(m.servizi_cod as nvarchar(5)),
cast(m.servizi_des as nvarchar(50))
from meridiano.dbo.servizi as m