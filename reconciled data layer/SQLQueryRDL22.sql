insert into reconcileddatalayer.dbo.services
select m.TIPOSERVIZIO_id,
cast(m.tiposervizio_cod as nvarchar(5)),
cast(m.tiposervizio_desridotta1 as nvarchar(50))
from meridiano.dbo.tiposervizio as m