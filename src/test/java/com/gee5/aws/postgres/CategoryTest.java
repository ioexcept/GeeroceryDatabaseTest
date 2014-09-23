package com.gee5.aws.postgres;

import static org.junit.Assert.*;
import org.junit.Test;

public class CategoryTest {

	private Category cat = new Category();
	
	public CategoryTest(){
		cat.setId(101);
		cat.setName("Vegitables");
	}
	
	@Test
	public void testGetId() {
		assertEquals(101, cat.getId());
	}

	@Test
	public void testGetName() {
		assertEquals("Vegitables", cat.getName());
	}

}


