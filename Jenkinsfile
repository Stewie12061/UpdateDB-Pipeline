pipeline {
    agent any

    environment {
        SQL_PASSWORD = credentials('sa-password-creds')
    }

    stages {
        stage('Update Databases') {
            steps {
                script {
                    def excelFormat = CSVFormat.EXCEL
                    def databaseInfo = readCSV file: 'DatabaseInfo.csv' , format: excelFormat.withHeader()
                    databaseInfo
                    // def parallelBranches = [:]

                    // for (row in databaseInfo) {
                    //     def server = row.Server
                    //     def database = row.Database

                    //     def branchLabel = "${server}_${database}"

                    //     parallelBranches[branchLabel] = {
                    //         echo "Updating database ${database} on server ${server}"
                    //         powershell script: """
                    //             UpdateDatabases.ps1 -server ${server} -database ${database} -scriptFolder ${env.WORKSPACE} -sqlPassword ${env.SQL_PASSWORD}
                    //         """
                    //     }
                    // }

                    // parallel parallelBranches
                }
            }
        }
    }
}