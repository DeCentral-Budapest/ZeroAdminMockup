select datetime(p.date_published, 'unixepoch', 'localtime') published_at, p.title, c.cnt
  from post p
  join (select post_id, count(*) cnt from comment group by post_id) c on c.post_id=p.post_id
  order by date_published desc;

select c.comment_id, datetime(date_added, 'unixepoch', 'localtime'), kv.value, c.body
  from comment c
  left join json f on f.json_id=c.json_id
  left join json u on f.directory=u.directory and u.file_name='content.json'
  left join keyvalue kv on u.json_id=kv.json_id and kv.key='cert_user_id'
  where c.post_id = 86
  order by c.date_added;


cat output.txt | perl -pe 's/[^,]*,(("(?<a>[^"]*)")|((?<a>[^,]*))),(?<b>\d+)/<li><a href="#">$+{a}<span class="badge">$+{b}<\/span><\/a><\/li>/' > x.txt

