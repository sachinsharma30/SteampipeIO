query "rss_steampipe_io_blog_post_totals" {
  sql = <<-EOQ
    select
      "Total Blog Posts" as label,
      count(*) as value
    from
      rss_item
    where
      feed_link = 'https://steampipe.io/blog/feed.xml'
  EOQ
}