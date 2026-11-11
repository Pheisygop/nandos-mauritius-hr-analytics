// Create a blank query named LoadHR, open Advanced Editor and paste this function.
// Create a Text parameter called DataFolder, e.g. C:\Nandos_HR\data
// Then create seven queries using the expressions below (six tables plus function).
(FileName as text) as table =>
let
    Source = Csv.Document(File.Contents(DataFolder & "\" & FileName), [Delimiter=",", Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    Headers = Table.PromoteHeaders(Source, [PromoteAllScalars=true])
in
    Headers

// Employees query: = LoadHR("Employees.csv")
// HRMonthly query: = LoadHR("HRMonthly.csv")
// Branches query: = LoadHR("Branches.csv")
// Calendar query: = LoadHR("Calendar.csv")
// Apply column types using the dictionary before Close & Apply.

// Roles query: = LoadHR("Roles.csv")
// StaffingTargets query: = LoadHR("StaffingTargets.csv")
