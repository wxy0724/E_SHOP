package com.atguigu.test;

import java.io.InputStream;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.solr.client.solrj.ResponseParser;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.impl.XMLResponseParser;
import org.apache.solr.common.util.NamedList;

import com.atguigu.bean.KEYWORDS_T_MALL_SKU;
import com.atguigu.factory.MySqlSessionFactory;
import com.atguigu.mapper.KeywordsMapper;
import com.atguigu.util.MyPropertiesUtil;

public class test2 {

	public static void main(String[] args) throws Exception {

		try {
		} catch (Exception e) {
			//
		} finally {
			//
		}
		SqlSessionFactory myFactory = MySqlSessionFactory.getMyFactory();

		SqlSession openSession = myFactory.openSession();

		KeywordsMapper mapper = myFactory.openSession().getMapper(KeywordsMapper.class);

		List<KEYWORDS_T_MALL_SKU> list_sku = mapper.select_sku_list_by_class2(28);
		
		//获取solr的客户端连接
		HttpSolrServer solr = new HttpSolrServer(MyPropertiesUtil.getMyProperties("mySolr.properties", "solr_url"));
		solr.setParser(new XMLResponseParser());
		solr.setConnectionTimeout(3000);
		
		//先删除原有数据
		solr.deleteByQuery("*:*");
		
		//向solr导入数据
		solr.addBeans(list_sku);
		solr.commit();

		System.out.println(list_sku);

	}
}
