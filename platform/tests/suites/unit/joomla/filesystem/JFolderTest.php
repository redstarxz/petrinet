<?php
/**
 * @package     Joomla.UnitTest
 *
 * @copyright   Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

include_once JPATH_PLATFORM . '/joomla/filesystem/folder.php';

/**
 * Test class for JFolder.
 * Generated by PHPUnit on 2011-10-26 at 19:32:37.
 */
class JFolderTest extends TestCase
{
    /**
     * @var JFolder
     */
    protected $object;

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     */
    protected function setUp() {
        //$this->object = new JFolder;
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     */
    protected function tearDown() {

    }

    /**
     * @todo Implement testCopy().
     */
    public function testCopy() {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
                'This test has not been implemented yet.'
        );
    }

    /**
     * @todo Implement testCreate().
     */
    public function testCreate() {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
                'This test has not been implemented yet.'
        );
    }

    /**
     * @todo Implement testDelete().
     */
    public function testDelete() {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
                'This test has not been implemented yet.'
        );
    }

    /**
     * @todo Implement testMove().
     */
    public function testMove() {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
                'This test has not been implemented yet.'
        );
    }

    /**
     * @todo Implement testExists().
     */
    public function testExists() {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
                'This test has not been implemented yet.'
        );
    }

	/**
	 * Tests the JFolder::files method.
	 *
	 * @return  void
	 *
	 * @since   12.1
	 */
	public function testFiles()
	{
		// Make sure previous test files are cleaned up
		$this->_cleanupTestFiles();

		// Make some test files and folders
		mkdir(JPath::clean(JPATH_TESTS . '/tmp/test'), 0777, true);
		file_put_contents(JPath::clean(JPATH_TESTS . '/tmp/test/index.html'), 'test');
		file_put_contents(JPath::clean(JPATH_TESTS . '/tmp/test/index.txt'), 'test');
		mkdir(JPath::clean(JPATH_TESTS . '/tmp/test/test'), 0777, true);
		file_put_contents(JPath::clean(JPATH_TESTS . '/tmp/test/test/index.html'), 'test');
		file_put_contents(JPath::clean(JPATH_TESTS . '/tmp/test/test/index.txt'), 'test');

		$expected = array(
			JPath::clean(JPATH_TESTS . '/tmp/test/index.txt'),
			JPath::clean(JPATH_TESTS . '/tmp/test/test/index.txt')
		);

		$this->assertEquals(
			$expected,
			JFolder::files(JPath::clean(JPATH_TESTS . '/tmp/test'), 'index.*', true, true, array('index.html')),
			'Line: ' . __LINE__ . ' Should exclude index.html files'
		);

		$this->assertEquals(
			array(
				JPath::clean(JPATH_TESTS . '/tmp/test/index.html'),
				JPath::clean(JPATH_TESTS . '/tmp/test/test/index.html')
			),
			JFolder::files(JPath::clean(JPATH_TESTS . '/tmp/test'), 'index.html', true, true),
			'Line: ' . __LINE__ . ' Should include full path of both index.html files'
		);

		$this->assertEquals(
			array(
				JPath::clean('index.html'),
				JPath::clean('index.html')
			),
			JFolder::files(JPath::clean(JPATH_TESTS . '/tmp/test'), 'index.html', true, false),
			'Line: ' . __LINE__ . ' Should include only file names of both index.html files'
		);

		$this->assertEquals(
			array(
				JPath::clean(JPATH_TESTS . '/tmp/test/index.html')
			),
			JFolder::files(JPath::clean(JPATH_TESTS . '/tmp/test'), 'index.html', false, true),
			'Line: ' . __LINE__ . ' Non-recursive should only return top folder file full path'
		);

		$this->assertEquals(
			array(
				JPath::clean('index.html')
			),
			JFolder::files(JPath::clean(JPATH_TESTS . '/tmp/test'), 'index.html', false, false),
			'Line: ' . __LINE__ . ' non-recursive should return only file name of top folder file'
		);

		$this->assertFalse(
			JFolder::files('/this/is/not/a/path'),
			'Line: ' . __LINE__ . ' Non-existent path should return false'
		);

		$this->assertEquals(
			array(),
			JFolder::files(JPath::clean(JPATH_TESTS . '/tmp/test'), 'nothing.here', true, true, array(), array()),
			'Line: ' . __LINE__ . ' When nothing matches the filter, should return empty array'
		);

		// Clean up our files
		$this->_cleanupTestFiles();
	}

	/**
	 * Tests the JFolder::folders method.
	 *
	 * @return  void
	 *
	 * @since   12.1
	 */
    public function testFolders()
	{
		// Make sure previous test files are cleaned up
		$this->_cleanupTestFiles();

		// Create the test folders
		mkdir(JPath::clean(JPATH_TESTS . '/tmp/test'), 0777, true);
		mkdir(JPath::clean(JPATH_TESTS . '/tmp/test/foo1'), 0777, true);
		mkdir(JPath::clean(JPATH_TESTS . '/tmp/test/foo1/bar1'), 0777, true);
		mkdir(JPath::clean(JPATH_TESTS . '/tmp/test/foo1/bar2'), 0777, true);
		mkdir(JPath::clean(JPATH_TESTS . '/tmp/test/foo2'), 0777, true);
		mkdir(JPath::clean(JPATH_TESTS . '/tmp/test/foo2/bar1'), 0777, true);
		mkdir(JPath::clean(JPATH_TESTS . '/tmp/test/foo2/bar2'), 0777, true);

		$this->assertEquals(
			array(),
			JFolder::folders(JPath::clean(JPATH_TESTS . '/tmp/test'), 'bar1', true, true, array('foo1', 'foo2'))
		);

		$this->assertEquals(
			array(JPath::clean(JPATH_TESTS . '/tmp/test/foo2/bar1')),
			JFolder::folders(JPath::clean(JPATH_TESTS . '/tmp/test'), 'bar1', true, true, array('foo1'))
		);
		$this->assertEquals(
			array(
				JPath::clean(JPATH_TESTS . '/tmp/test/foo1/bar1'),
				JPath::clean(JPATH_TESTS . '/tmp/test/foo2/bar1'),
			),
			JFolder::folders(JPath::clean(JPATH_TESTS . '/tmp/test'), 'bar1', true, true)
		);

		$this->assertEquals(
			array(
				JPath::clean(JPATH_TESTS . '/tmp/test/foo1/bar1'),
				JPath::clean(JPATH_TESTS . '/tmp/test/foo1/bar2'),
				JPath::clean(JPATH_TESTS . '/tmp/test/foo2/bar1'),
				JPath::clean(JPATH_TESTS . '/tmp/test/foo2/bar2'),
			),
			JFolder::folders(JPath::clean(JPATH_TESTS . '/tmp/test'), 'bar', true, true)
		);

		$this->assertEquals(
			array(
				JPath::clean(JPATH_TESTS . '/tmp/test/foo1'),
				JPath::clean(JPATH_TESTS . '/tmp/test/foo1/bar1'),
				JPath::clean(JPATH_TESTS . '/tmp/test/foo1/bar2'),
				JPath::clean(JPATH_TESTS . '/tmp/test/foo2'),
				JPath::clean(JPATH_TESTS . '/tmp/test/foo2/bar1'),
				JPath::clean(JPATH_TESTS . '/tmp/test/foo2/bar2'),
			),
			JFolder::folders(JPath::clean(JPATH_TESTS . '/tmp/test'), '.', true, true)
		);

		$this->assertEquals(
			array(
				JPath::clean('bar1'),
				JPath::clean('bar1'),
				JPath::clean('bar2'),
				JPath::clean('bar2'),
				JPath::clean('foo1'),
				JPath::clean('foo2'),
			),
			JFolder::folders(JPath::clean(JPATH_TESTS . '/tmp/test'), '.', true, false)
		);

		$this->assertEquals(
			array(
				JPath::clean(JPATH_TESTS . '/tmp/test/foo1'),
				JPath::clean(JPATH_TESTS . '/tmp/test/foo2'),
			),
			JFolder::folders(JPath::clean(JPATH_TESTS . '/tmp/test'), '.', false, true)
		);

		$this->assertEquals(
			array(
				JPath::clean('foo1'),
				JPath::clean('foo2'),
			),
			JFolder::folders(JPath::clean(JPATH_TESTS . '/tmp/test'), '.', false, false, array(), array())
		);

		$this->assertFalse(
			JFolder::folders('this/is/not/a/path'),
			'Line: ' . __LINE__. ' Non-existent path should return false'
		);

		// Clean up the folders
		rmdir(JPath::clean(JPATH_TESTS . '/tmp/test/foo2/bar2'));
		rmdir(JPath::clean(JPATH_TESTS . '/tmp/test/foo2/bar1'));
		rmdir(JPath::clean(JPATH_TESTS . '/tmp/test/foo2'));
		rmdir(JPath::clean(JPATH_TESTS . '/tmp/test/foo1/bar2'));
		rmdir(JPath::clean(JPATH_TESTS . '/tmp/test/foo1/bar1'));
		rmdir(JPath::clean(JPATH_TESTS . '/tmp/test/foo1'));
		rmdir(JPath::clean(JPATH_TESTS . '/tmp/test'));
    }

    /**
     * @todo Implement testListFolderTree().
     */
    public function testListFolderTree() {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
                'This test has not been implemented yet.'
        );
    }

	/**
	 * Tests the JFolder::makeSafe method.
	 *
	 * @return  void
	 *
	 * @since   12.1
	 */
    public function testMakeSafe()
	{
		$actual = JFolder::makeSafe('test1/testdirectory');
		$this->assertEquals('test1/testdirectory', $actual);
    }

	/**
	 * Convenience method to cleanup before and after testFiles
	 *
	 * @return  void
	 *
	 * @since   12.1
	 */
	private function _cleanupTestFiles()
	{
		$this->_cleanupFile(JPath::clean(JPATH_TESTS . '/tmp/test/test/index.html'));
		$this->_cleanupFile(JPath::clean(JPATH_TESTS . '/tmp/test/test/index.txt'));
		$this->_cleanupFile(JPath::clean(JPATH_TESTS . '/tmp/test/test'));
		$this->_cleanupFile(JPath::clean(JPATH_TESTS . '/tmp/test/index.html'));
		$this->_cleanupFile(JPath::clean(JPATH_TESTS . '/tmp/test/index.txt'));
		$this->_cleanupFile(JPath::clean(JPATH_TESTS . '/tmp/test'));
	}

	/**
	 * Convenience method to clean up for files test
	 *
	 * @param   string  $path  The path to clean
	 *
	 * @return  void
	 *
	 * @since   12.1
	 */
	private function _cleanupFile($path)
	{
		if (file_exists($path))
		{
			if (is_file($path))
			{
				unlink($path);
			}
			elseif (is_dir($path))
			{
				rmdir($path);
			}
		}
	}
}
