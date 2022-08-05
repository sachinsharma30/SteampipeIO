dashboard "SachinDashboards" {

    title = "Sachin's S3 Dashboard"

    image {
        src = "https://steampipe.io/images/steampipe_logo_wordmark_color.svg"
        alt = "Steampipe Logo"
        width = 3
    }

    container {
        card {
            sql = <<-EOQ
                select
                    count(*) as "Total Buckets"
                from
                    aws_s3_bucket
            EOQ
            width = 2
        } 
    }

    container {
        title = "Graphs"

        chart {
            title = "Total Buckets"
            sql = <<-EOQ
                select
                    a.title as "account",
                    count(i.*) as "total"
                from
                    aws_s3_bucket as i,
                    aws_account as a
                where
                    a.account_id = i.account_id
                group by
                    account
                order by count(i.*) desc
            EOQ
            
            type  = "column"
            width = 4
        }


        chart {
            title = "Buckets by Region"
            sql = <<-EOQ
                select
                    region,
                    count(i.*) as total
                from
                    aws_s3_bucket as i
                group by
                    region
            EOQ
            
            type  = "column"
            width = 4
        }

        chart {
            title = "Bucket Titles"
            sql = <<-EOQ
                select
                    title,
                    count(i.*) as total
                from
                    aws_s3_bucket as i
                group by
                    title
            EOQ
            
            type  = "column"
            width = 4
        }

        chart {
            type  = "bar"
            title = "AWS S3 Buckets by Region"

            sql = <<-EOQ
                select
                    region as Region,
                    count(*) as Total
                from
                    aws_s3_bucket
                group by
                    region
                order by
                    Total desc
            EOQ
        }
    }
}