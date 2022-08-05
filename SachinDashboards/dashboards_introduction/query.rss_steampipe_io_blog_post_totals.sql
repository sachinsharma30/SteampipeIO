query "rss_steampipe_io_blog_post_totals" {
  sql = <<-EOQ
    select
      count(*) as "Total Blog Posts"
    from
      rss_item
    where
      feed_link = 'https://steampipe.io/blog/feed.xml'
  EOQ
}