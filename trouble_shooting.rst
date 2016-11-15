.. include:: /common/stub-variables.txt

Troubleshooting
===============

Invalid object name 'bcms_users.Users'.
---------------------------------------

If you get this error it is becuase the database you are connecting to does not have the phonebook tables created yet.

To fix this follow the steps below.

#. Find the web Root folder of |product|.  This can easily be done by looking in IIS.
#. In the Root folder find the App_Data folder
#. Delete the versions.info.cache file
#. Run the website again


    