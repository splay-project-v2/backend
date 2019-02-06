function receive_set(rec_set)
  local sent_set = misc.random_pick(neighbours, shuffle_length)
  cyclon_insert(rec_set, sent_set)
  return sent_set
end