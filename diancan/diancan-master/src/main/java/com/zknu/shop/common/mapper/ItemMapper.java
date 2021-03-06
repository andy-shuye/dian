package com.zknu.shop.common.mapper;

import com.zknu.shop.common.pojo.Item;
import com.zknu.shop.common.pojo.ItemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ItemMapper {
    int countByExample(ItemExample example);

    int deleteByExample(ItemExample example);

    int deleteByPrimaryKey(Long itemId);

    int insert(Item record);

    int insertSelective(Item record);

    List<Item> selectByExample(ItemExample example);

    Item selectByPrimaryKey(Long itemId);

    int updateByExampleSelective(@Param("record") Item record, @Param("example") ItemExample example);

    int updateByExample(@Param("record") Item record, @Param("example") ItemExample example);

    int updateByPrimaryKeySelective(Item record);

    int updateByPrimaryKey(Item record);
}