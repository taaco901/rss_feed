output "checkRSSFeeds_url" {
  value = module.checkRSSFeeds["checkRSSFeeds"].cf_url
}

output "sendRSSEmail_url" {
  value = module.checkRSSFeeds["sendRSSEmail"].cf_url
}
