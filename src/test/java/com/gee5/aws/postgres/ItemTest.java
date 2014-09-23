package com.gee5.aws.postgres;
import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class ItemTest {

	private Item testItem = new Item();
	
	public ItemTest(){
		testItem.setId(100);
		testItem.setRef_id(210);
		testItem.setName("Demo");
	}

	@Test
	public void testGetId() {
		assertEquals(100, testItem.getId());
	}

	@Test
	public void testGetRef_id() {
		assertEquals(210, testItem.getRef_id());
	}

	@Test
	public void testGetName() {
		assertEquals("Demo", testItem.getName());
	}

}

