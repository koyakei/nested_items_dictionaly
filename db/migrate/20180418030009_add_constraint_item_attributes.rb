class AddConstraintItemAttributes < ActiveRecord::Migration[5.2]
  def change
    execute"CREATE FUNCTION has_same_standard_unit(bigint, bigint) RETURNS boolean
    AS ' select ( select standard_unit_id from attribute_types where id = $1) = (select standard_unit_id from display_units where id = $2 );'
    LANGUAGE SQL
    STABLE
    RETURNS NULL ON NULL INPUT;"
    execute"alter table item_attribute_types add constraint has_same_standard_unit check (has_same_standard_unit(attribute_type_id, display_unit_id))"
  end
end
