project_name: "project_that_will_be_imported_b"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

remote_dependency: test_pi {
  url: "git@github.com:LeticiaEsparza/test_pi.git"
  ref: "8629856201364ac1e3210083ebd20720a9bee146"
}


constant: test {
  value: "test_chelsea"
}
