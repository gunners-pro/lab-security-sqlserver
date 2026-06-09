use TechCorp
go
create table hr.Employees (
	EmployeeId int identity(1, 1) not null,
	FirstName varchar(80) not null,
	LastName varchar(150) not null,
	Email varchar(255) not null,
	HireDate datetime2 not null,
	DepartmentId int not null,
	Position varchar(100)
	constraint pk_employee_id primary key clustered (EmployeeId)
)
create table hr.Salaries (
	SalaryId int identity(1, 1) not null,
	EmployeeId int not null,
	BaseSalary decimal(18, 2) not null,
	Bonus decimal(18, 2) not null,
	EffectiveDate datetime2 not null
	constraint pk_salary_id primary key clustered (SalaryId),
	constraint fk_salarie_employee_id foreign key (EmployeeId) references hr.Employees(EmployeeId)
)
create table hr.Benefits (
	BenefitId int identity(1, 1) not null,
	EmployeeId int not null,
	BenefitType varchar(100) not null,
	Amount decimal(18, 2) not null
	constraint pk_benefit_id primary key clustered (BenefitId),
	constraint fk_benefit_employee_id foreign key (EmployeeId) references hr.Employees(EmployeeId)
)
create table finance.AccountsPayable (
	AccountPayableId int identity(1, 1) not null,
	VendorName varchar(255) not null,
	Amount decimal(18, 2) not null,
	DueDate datetime2 not null,
	Status varchar(50) not null
	constraint pk_account_payable_id primary key clustered (AccountPayableId)
)
create table finance.AccountsReceivable (
	AccountReceivableId int identity(1, 1) not null,
	CustomerName varchar(255) not null,
	Amount decimal(18, 2) not null,
	DueDate datetime2 not null,
	Status varchar(50) not null
	constraint pk_account_receivable_id primary key clustered (AccountReceivableId)
)
create table finance.CashFlow (
	TransactionId int identity(1, 1) not null,
	TransactionDate datetime2 not null,
	Amount decimal(18, 2) not null,
	TransactionType varchar(50) not null,
	Description varchar(255)
	constraint pk_cashflow_transaction_id primary key clustered (TransactionId)
)
create table sales.Customers (
	CustomerId int identity(1, 1) not null,
	CompanyName varchar(255) not null,
	ContactName varchar(255) not null,
	Email varchar(255) not null,
	Phone varchar(50) not null,
	constraint pk_customers_customer_id primary key clustered (CustomerId)
)
create table sales.Orders (
	OrderId int identity(1, 1) not null,
	CustomerId int not null,
	OrderDate datetime2 not null,
	TotalAmount decimal(18, 2) not null,
	constraint pk_orders_order_id primary key clustered (OrderId),
	constraint fk_orders_customer_id foreign key (CustomerId) references sales.Customers(CustomerId)
)
create table sales.Contracts (
	ContractId int identity(1, 1) not null,
	CustomerId int not null,
	StartDate datetime2 not null,
	EndDate datetime2 not null,
	ContractValue decimal(18, 2) not null
	constraint pk_contracts_contract_id primary key clustered (ContractId),
	constraint fk_contracts_customer_id foreign key (CustomerId) references sales.Customers(CustomerId)
)
create table it.Assets (
	AssetId int identity(1, 1) not null,
	AssetName varchar(255) not null,
	AssetType varchar(100) not null,
	PurchaseDate datetime2 not null,
	Status varchar(50) not null
	constraint pk_assets_asset_id primary key clustered (AssetId)
)
create table it.Workstations (
	WorkstationId int identity(1, 1) not null,
	EmployeeId int not null,
	Hostname varchar(255) not null,
	OperatingSystem varchar(100) not null
	constraint pk_workstations_workstation_id primary key clustered (WorkstationId),
	constraint fk_workstations_employee_id foreign key (EmployeeId) references hr.Employees(EmployeeId)
)
create table it.Tickets (
	TicketId int identity(1, 1) not null,
	EmployeeId int not null,
	OpenDate datetime2 not null,
	CloseDate datetime2,
	Status varchar(50) not null,
	Description varchar(255)
	constraint pk_tickets_ticket_id primary key clustered (TicketId),
	constraint fk_tickets_employee_id foreign key (EmployeeId) references hr.Employees(EmployeeId)
)
go