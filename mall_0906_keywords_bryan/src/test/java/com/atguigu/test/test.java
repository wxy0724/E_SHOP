package com.atguigu.test;

import java.io.InputStream;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.solr.client.solrj.ResponseParser;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.impl.XMLResponseParser;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.util.NamedList;

import com.atguigu.bean.KEYWORDS_T_MALL_SKU;
import com.atguigu.factory.MySqlSessionFactory;
import com.atguigu.mapper.KeywordsMapper;
import com.atguigu.util.MyPropertiesUtil;

public class test {

	public static void main(String[] args) throws Exception {

		//获取solr的客户端连接
		HttpSolrServer solr = new HttpSolrServer(MyPropertiesUtil.getMyProperties("mySolr.properties", "solr_url"));
		solr.setParser(new XMLResponseParser());
		solr.setConnectionTimeout(3000);
		
		//定义查询参数
		SolrQuery solrQuery = new SolrQuery();
		solrQuery.setQuery("copy_item:小明");
		solrQuery.setRows(50);
		//向solr查询数据
		QueryResponse query = solr.query(solrQuery);
		
		List<KEYWORDS_T_MALL_SKU> sku_list = query.getBeans(KEYWORDS_T_MALL_SKU.class);

		System.out.println(sku_list);

	}
}
