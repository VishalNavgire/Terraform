location    = "West Europe"

environment = "dev"

runbooks = [

  {
    name         = "python-test-runbook"
    description  = "Python automation runbook"
    runbook_type = "Python3"
    file_content = "../runbooks/python/test.py"
  },

  {
    name         = "powershell-test-runbook"
    description  = "PowerShell automation runbook"
    runbook_type = "PowerShell"
    file_content = "../runbooks/powershell/test.ps1"
  }

]