create database google
go

use google
go

--schema for google search console
create schema gsc
go


--drop table google.gsc.tbGscByWeb;
create table google.gsc.tbGscByWeb (
id bigint identity(1,1),
gscData ntext,--#nvarchar(max),
gscSiteUrl nvarchar(max),
gscDate datetime,
insDate datetime default getdate(),
insDateUTC datetime default getutcdate()
);


SELECT
ISJSON(cast(gscData as nvarchar(max))),
JSON_QUERY(cast(gscData as nvarchar(max)),'$.rows[0]') AS rows,

JSON_value(
JSON_QUERY(cast(gscData as nvarchar(max)),'$.rows[0].keys') ,
'$.keys') 
AS rows_keysxxxx,


JSON_QUERY(cast(gscData as nvarchar(max)),'$.rows[0].keys') AS rows_keys,
JSON_value(cast(gscData as nvarchar(max)),'$.rows[0].clicks') AS rows_clicks,
JSON_value(cast(gscData as nvarchar(max)),'$.rows[0].impressions') AS rows_impressions,
JSON_value(cast(gscData as nvarchar(max)),'$.rows[0].ctr') AS rows_ctr,
JSON_value(cast(gscData as nvarchar(max)),'$.rows[0].position') AS rows_position,
gsc.*
FROM google.gsc.tbGscByWeb gsc
