avonet_in_jetz_taxonomy = function(data_dir = '../../data') {
  avonet_birdlife_input_tmp = read_csv(paste(data_dir, 'third_party', 'columbidae_birdlife__avonet.csv', sep = '/'))
  avonet_birdlife = avonet_birdlife_input_tmp[,c('Species1', 'Beak.Length_Culmen', 'Beak.Width', 'Beak.Depth', 'Tail.Length', 'Wing.Length', 'Tarsus.Length', 'Habitat', 'Habitat.Density', 'Trophic.Niche', 'Primary.Lifestyle', 'Range.Size', 'Mass')]
  names(avonet_birdlife) = c('species_name', 'beak_length', 'beak_width', 'beak_depth', 'tail_length', 'wing_length', 'tarsus_length', 'habitat', 'habitat_density', 'trophic_niche', 'primary_lifestyle', 'range_size', 'mass')
  head(avonet_birdlife)
  
  birdlife_to_jetz_mapping = read_csv(paste(data_dir, 'bigquery', 'columbidae_birdlife_to_jetz__taxonomic_mapping.csv', sep = '/'))
  
  avonet_birdlife_mapped_to_jetz_tmp = left_join(birdlife_to_jetz_mapping, avonet_birdlife)
  duplicated_jetz_species_in_avonet = avonet_birdlife_mapped_to_jetz_tmp$jetz_scientific_name[duplicated(avonet_birdlife_mapped_to_jetz_tmp$jetz_scientific_name)]
  avonet_birdlife_mapped_to_jetz_tmp[avonet_birdlife_mapped_to_jetz_tmp$jetz_scientific_name %in% duplicated_jetz_species_in_avonet,] %>% arrange(jetz_scientific_name)
  
  avonet_birdlife_mapped_to_jetz_tmp %>% group_by(jetz_scientific_name) %>% summarize(
    beak_length = mean(beak_length),
    beak_width = mean(beak_width),
    beak_depth = mean(beak_depth),
    tail_length = mean(tail_length),
    wing_length = mean(wing_length),
    tarsus_length = mean(tarsus_length),
    trophic_niche = first(trophic_niche),
    habitat = first(habitat),
    habitat_density = first(habitat_density),
    primary_lifestyle = first(primary_lifestyle),
    range_size = sum(range_size),
    mass = mean(mass)
  )
}