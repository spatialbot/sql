SELECT GDB_ITEMS.UUID AS "Dataset ID",
       substr(GDB_ITEMS.NAME,1,(INSTR(GDB_ITEMS.NAME,'.',1)-1)) AS "Owner"
FROM GDB_ITEMTYPES,
  GDB_ITEMS
WHERE GDB_ITEMTYPES.UUID = GDB_ITEMS.TYPE
AND GDB_ITEMTYPES.NAME  = 'Feature Dataset'
