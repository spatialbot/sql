USE [master]
GO

declare @dbname varchar(200)
declare @mSql1 varchar(8000)

CREATE TABLE #DBROLES
(
DBName sysname not null,
UserName sysname not null,
db_denydatareader varchar(3) not null
)

DECLARE DBName_Cursor CURSOR FOR
	SELECT name
	FROM master.dbo.sysdatabases
	WHERE name not in ('mssecurity','tempdb','model','msdb')
	ORDER by name

OPEN DBName_Cursor
FETCH NEXT FROM DBName_Cursor INTO @dbname
WHILE @@FETCH_STATUS = 0

BEGIN
	SET @mSQL1 = ' INSERT into #DBROLES ( DBName, UserName, db_denydatareader)
	SELECT '+''''+@dbName+''''+ ' as DBName ,UserName, '+char(13)+ '
		Max(CASE RoleName WHEN ''db_denydatareader'' THEN ''Yes'' ELSE ''No'' END) AS db_denydatareader
	FROM (
		SELECT b.name as UserName, c.name as RoleName
		FROM ' + @dbName+'.dbo.sysmembers a '+char(13)+ '
		JOIN '+ @dbName+'.dbo.sysusers b '+char(13)+ '
		ON a.memberuid = b.uid 
		JOIN '+@dbName+'.dbo.sysusers c
		ON a.groupuid = c.uid 
		WHERE c.name = ''db_denydatareader'')s
		GROUP by UserName
		ORDER by UserName'

EXECUTE (@mSql1)

FETCH NEXT FROM DBName_Cursor INTO @dbname
END
CLOSE DBName_Cursor
DEALLOCATE DBName_Cursor

SELECT * 
FROM #DBRoles
ORDER BY DBName
DROP TABLE #DBROLES

