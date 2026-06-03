create database TechCorp
on primary
(
	name = N'TechCorp_Primary',
	filename = N'E:\Data\TechCorp_Primary.mdf',
	filegrowth = 256mb,
	size = 256mb
),
filegroup FB_INDEX
(
	name = N'TechCorp_Indexes',
	filename = N'E:\Data\TechCorp_Indexes.ndf',
	filegrowth = 256mb,
	size = 256mb
)
log on
(
	name = N'TechCorp_Logs',
	filename = N'F:\Logs\TechCorp_Logs.ldf',
	filegrowth = 256mb,
	size = 256mb,
	maxsize = 1024mb
)
go

alter database TechCorp
set recovery full
go