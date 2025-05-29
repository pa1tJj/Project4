package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

@Repository
@Transactional
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    public static void joinTable(BuildingSearchRequest bsr, StringBuilder sql) {
        if (bsr.getStaffId() != null) {
            sql.append(" JOIN assignmentbuilding a ON a.buildingid = b.id ");
        }
        if (bsr.getAreaFrom() != null || bsr.getAreaTo() != null) {
            sql.append(" JOIN rentarea r ON r.buildingid = b.id ");
        }
    }

    public static void queryNormal(BuildingSearchRequest buildingSearchRequest, StringBuilder sql) {
        try {
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();
            for (Field it : fields) {
                it.setAccessible(true);
                String fieldName = it.getName();
                if (!fieldName.equals("staffId") && !fieldName.equals("areaFrom") && !fieldName.equals("areaTo")
                        && !fieldName.equals("rentPriceFrom") && !fieldName.equals("rentPriceTo")) {
                    Object value = it.get(buildingSearchRequest);
                    if (value != null) {
                        if (it.getType().getName().equals("java.lang.Long") || it.getType().getName().equals("java.lang.Integer")) {
                            sql.append(" AND b." + fieldName + " = " + value);
                        } else if (it.getType().getName().equals("java.lang.String") && !value.equals("")) {
                            sql.append(" AND b." + fieldName + " LIKE '%" + value + "%'");
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void querySpecial(BuildingSearchRequest buildingSearchRequest, StringBuilder sql) {
        if (buildingSearchRequest.getStaffId() != null) {
            sql.append(" AND a.staffid = " + buildingSearchRequest.getStaffId());
        }

        if (buildingSearchRequest.getRentPriceFrom() != null || buildingSearchRequest.getRentPriceTo() != null) {
            if (buildingSearchRequest.getRentPriceFrom() != null) {
                sql.append(" AND b.rentprice >=" + buildingSearchRequest.getRentPriceFrom());
            }
            if (buildingSearchRequest.getRentPriceTo() != null) {
                sql.append(" AND b.rentprice <=" + buildingSearchRequest.getRentPriceTo());
            }
        }

        if (buildingSearchRequest.getAreaFrom() != null) {
            sql.append(" AND r.value >=" + buildingSearchRequest.getAreaFrom());
        } else if (buildingSearchRequest.getAreaTo() != null) {
            sql.append(" AND r.value <=" + buildingSearchRequest.getAreaTo());
        }

        if (buildingSearchRequest.getTypeCode() != null && buildingSearchRequest.getTypeCode().size() != 0) {
            sql.append(" AND (");
            String str = buildingSearchRequest.getTypeCode().stream().map(it -> "b.type LIKE" + "'%" + it + "%'").collect(Collectors.joining(" OR "));
            sql.append(str);
            sql.append(" ) ");
        }
    }

    @Override
    public List<BuildingEntity> findBuildings(BuildingSearchRequest buildingSearchRequest) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b ");
        joinTable(buildingSearchRequest, sql);
        StringBuilder where = new StringBuilder(" WHERE 1 = 1 ");
        queryNormal(buildingSearchRequest, where);
        querySpecial(buildingSearchRequest, where);
        where.append(" GROUP BY(b.id) ");
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }
}
