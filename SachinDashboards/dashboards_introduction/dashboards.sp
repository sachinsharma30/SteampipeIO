dashboard "dashboard_tutorial" {
  title = "Dashboard Tutorial"
  
  text {
    value = "This will guide you through the key concepts of building your own dashboards."
  }
  text {
    value = "created by Sachin Sharma, Aug 2nd, 2022"
  }
  input "name" {
    title = "Which S3 Bucket?"
    type = "select"
    width = 3
    sql = <<-EOQ
        select 
            title as label,
            instance_type as value
        from
            aws_ec2_instance;
    EOQ
  }
  image { 
    src = "https://www.skysports.com/nba/news/36244/12636502/golden-state-warriors-2022-champions-a-story-of-individual-and-collective-renaissance"
    alt = "Dubs Champions"
    width = 3
  }
}
