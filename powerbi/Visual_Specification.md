# Native Power BI report specification

Canvas: 1280×720, background #F5F3EF. Header at (32,20), title at (32,52), disclosure footer at (32,690). Title 26 pt, card values 24 pt, chart titles 12 pt. Accent red #D94132, teal #31978C, charcoal #242B32. Four KPI cards at x=32,340,648,956; y=110; width=284, height=100. Four chart panels at x=32/656, y=230/450, width=592, height=210. Use separate slicer strip or expand canvas height if slicers would overlap. Navigation buttons link report pages. Use measure formatting, not text-converted measures, for numeric axes.

All pages: Calendar[YearMonth], Branches[Branch], Roles[Department] slicers. Branch is the category axis for all branch charts. All charts should use measures, never sum a salary or headcount flag across all months without its defined measure.

| Page | KPI cards | Charts (native visual; category → measure) |
|---|---|---|
| 1 Workforce Overview | Closing Headcount, Hires, Exits, Gross Pay MUR | Bar: Branch → Closing Headcount; bar: Branch → Hires; bar: Branch → Exits; bar: Branch → Gross Pay MUR. Add Gender and Role in headcount tooltips or a drillthrough page. |
| 2 Retention & Movement | Opening Headcount, Exits, Voluntary Exits, Turnover Rate | Bar: Branch → Opening Headcount; bar: Branch → Exits; bar: Branch → Voluntary Exits; bar: Branch → Hires. Add Turnover Rate and Average Headcount to tooltips. Optional reason chart: Employees[ExitReason] → Exits, filter blank reasons out. |
| 3 Attendance & Overtime | Absent Days, Absence Rate, Overtime Hours, Paid Leave Days | Bar: Branch → Absent Days; bar: Branch → Overtime Hours; bar: Branch → Paid Leave Days; bar: Branch → Overtime Pay MUR. Add Scheduled Days and Absence Rate to absence tooltips. |
| 4 Pay & Development | Gross Pay MUR, Training Completion Rate, Training Hours, Average Engagement | Bar: Branch → Gross Pay MUR; bar: Branch → Overtime Pay MUR; bar: Branch → Training Completed; bar: Branch → Training Hours. Add Training Assigned and Training Completion Rate to training tooltips. |

Companion HTML also includes an all-month closing-headcount sparkline per page for the selected branch/department. This trend intentionally ignores the single-month dropdown, and is labelled accordingly. In Power BI use Edit interactions so the month slicer does not filter that trend chart; keep branch and department interactions enabled.

Checks: select October 2026, compare all KPI totals with validation.json; filter one branch and confirm the six-branch bars reduce to that branch; reset filters; verify reconciliation measures remain zero. Cross-chart selection should filter the other visuals on the same page. Add a Reset filters bookmark if desired. Native report completion and these interactions must be verified in Desktop.

## Page 5: Casa Staffing & Structure

Cards: Target Headcount, Closing Headcount, Closing FTE, Part Time Closing Headcount. Matrix rows: Roles[Role]; values: Target Headcount, Closing Headcount, Closing FTE, Unfilled Posts. Optional Branches[Branch] parent rows. Slicers: Calendar[YearMonth], Branches[Branch], Roles[Department]. Add a text panel for Patrao → 2 Assistant Managers → operational teams. Label baseline counts as planning assumptions; part-time ratio and 0.5 FTE remain provisional. The PNG shows the October 2026 total of 198 people versus a baseline of 198, and 186 FTE.

On page 5, add Brand Ambassador Headcount to the role matrix and show BOH Brand Ambassadors and FOH Brand Ambassadors in the structure panel or extra cards. At all six casas these should read 18 total, 12 BOH and 6 FOH. Flag is an additional responsibility and must not be counted as an extra role/post.

Central organisation update: label headcount and payroll visuals as casa staff only. Page 5 should show the confirmed General Manager → Area / Operations Manager → Patrao line, Head of People → HR, and Training and Development Manager → Guest Experience Manager. List Finance and Marketing as central functions. The Training and Development Manager reports to the Area / Operations Manager. Mark other unspecified reporting parents and central employee counts as unconfirmed; exclude central structure rows from employee KPIs. The optional disconnected OrganisationStructure table supplies reference labels, not employee facts.

Use the heading CENTRAL SUPPORT · Head Office for the central organisation panel. Group all management senior to Patrao and the head-office support teams under Central Support; casa Patraos and their teams remain under their casas.

Native model correction: measures are named Total Hires and Total Exits to avoid colliding with raw Hires/Exits flag columns. Report charts and DAX measure dependencies use the corrected names.
