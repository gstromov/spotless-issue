-- noinspection SqlResolveForFile

set
search_path to my_schema;

/* [jooq ignore start] */
create
  view requirements_hierarchy as with recursive hierarchy as(
    select
      distinct requirement.id requirement_id,
      null::uuid parent_requirement_id,
      0 as depth,
      requirement.created_at
    from
      requirement left join requirements_linking on
      requirements_linking.source = requirement.id
    where
      not exists(
        select
          1
        from
          requirements_linking
        where
          target = requirement.id
          and requirements_linking.type_id = 1
      )
  union all select
      rl.target,
      rl.source,
      rh.depth + 1,
      rh.created_at
    from
      hierarchy rh join requirements_linking rl on
      rh.requirement_id = rl.source
      and rl.type_id = 1
  ),
  last_version as(
    select
      requirement.id,
      requirement.code,
      requirement.space_id,
      requirement_version.title
    from
      requirement,
      requirement_version
    where
      requirement.id = requirement_version.requirement_id
      and requirement_version.version =(
        select
          max( version )
        from
          requirement_version
        where
          requirement_version.requirement_id = requirement.id
      )
  ) select
    hierarchy.*,
    last_version.title,
    last_version.code requirement_code,
    space.code space_code
  from
    hierarchy,
    last_version,
    space
  where
    hierarchy.requirement_id = last_version.id
    and last_version.space_id = space.id;

/* [jooq ignore stop] */