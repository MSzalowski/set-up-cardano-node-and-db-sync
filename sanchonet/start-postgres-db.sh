docker run --name postgres \
  -e POSTGRES_DB=cexplorer \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -p 5432:5432 \
  -d postgres:15-alpine \
  postgres -c maintenance_work_mem=1GB -c max_parallel_maintenance_workers=4