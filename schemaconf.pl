{
  schema_class => "GBTrains::Schema",
  connect_info => {
    dsn => "dbi:SQLite:mca.sqlite",
  },
  loader_options => {
    overwrite_modifications => 1,
    moniker_map => sub { "$_[0]" },
  },
};
