<?php


namespace portalove;

class DB
{

    private $host;
    private $dbname;
    private $username;
    private $password;
    private $port;

    private $connection;


    public function __construct($host, $dbname, $username, $password, $port = 3308)
    {
        $this->host = $host;
        $this->dbname = $dbname;
        $this->username = $username;
        $this->password = $password;
        $this->port = $port;


        try {
            $this->connection = new \PDO('mysql:host=' . $host . ';dbname=' . $dbname . ";port=" . $port, $username, $password);

            $dbh = null;


        } catch (\PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            die();
        }
    }

    public function printGameRows()
    {
        foreach ($this->connection->query('SELECT * from game') as $row) {
            var_dump($row);
            echo "<br><br>";
        }
    }

    public function getMenu()
    {
        $menuItems = [];

        $sql = "SELECT * FROM menu";
        $query = $this->connection->query($sql);
        while ($row = $query->fetch()) {
            $menuItems[] = [
                "id" => $row['id'],
                "name" => $row['display_name'],
                "path" => $row['path'],
            ];
        }
        return $menuItems;

    }

    public function getMenuItem($id)
    {
        $sql = "SELECT * FROM menu WHERE id = " . $id;
        try {
            $query = $this->connection->query($sql);
            $menuItem = $query->fetch(\PDO::FETCH_ASSOC);

            return $menuItem;

        } catch (\PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            return [];
        }
    }


    public function insertMenuItem($display_name, $sys_name, $path)
    {
        $currentDateTime = date('Y-m-d H:i:s', time());
        $sql = "INSERT INTO menu(display_name, sys_name, path, created_at, updated_at)
            VALUE('" . $display_name . "','" . $sys_name . "','" . $path . "','" . $currentDateTime . "','" . $currentDateTime . "')";

        try {
            $this->connection->exec($sql);

            return true;

        } catch (\PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            return false;
        }

    }


    public function deleteMenuItem($id)
    {
        $sql = "DELETE FROM menu WHERE id = ".$id;
        try {
            $this->connection->exec($sql);
            return true;
        } catch (\PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            return false;
        }
    }

    public function updateMenuItem($display_name, $sys_name, $path, $id)
    {
        $currentDateTime = date('Y-m-d H:i:s', time());
        $sql = "UPDATE menu SET display_name = '".$display_name."', sys_name = '".$sys_name."', path = '".$path."', updated_at = '".$currentDateTime."' WHERE id = ".$id;

        try {
            $this->connection->exec($sql);

            return true;

        } catch (\PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            return false;
        }

    }

    public function login($username, $password)
    {
        $sql = "SELECT COUNT(id) AS is_admin FROM user WHERE username = '".$username."' AND password = '".sha1($password)."'";

        try {
            $query = $this->connection->query($sql);
            $isAdmin = $query->fetch(\PDO::FETCH_ASSOC);

            if($isAdmin['is_admin'] == 1) {
                return true;
            } else {
                return false;
            }

        } catch (\PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            return false;
        }
    }


}

?>