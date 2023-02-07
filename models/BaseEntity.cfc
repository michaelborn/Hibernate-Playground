component 
		name="BaseEntity" 
		persistent="false" 
		accessors="true"
{
	property 	name="id" 
					fieldtype="id" 
					column="id"
					ormtype="string" 
					generator="assigned"
					insert="true"
					update="false"
					persistent=true;

	property 	name="createdTime"  
					ormtype="timestamp" 
					sqltype="datetimeoffset" 
					insert="true"
					update="false"
					persistent=true;

	property 	name="createdBy" 
					fieldtype="many-to-one" 
					cfc="User" 
					fkcolumn="FK_creationUser"
					insert="true"
					update="false"
					lazy="true"
					persistent=true;

	property 	name="modifiedTime"
					ormtype="timestamp" 
					sqltype="datetimeoffset" 
					persistent=true;

	property 	name="modifiedBy" 
					fieldtype="many-to-one" 
					cfc="User" 
					fkcolumn="FK_modificationUser" 
					lazy="true"
					persistent=true;

	property 	name="isActive" 
					ormtype="boolean" 
					sqltype="bit" 
					notnull="true"
					persistent=true
					default=true
					dbdefault=1;
}