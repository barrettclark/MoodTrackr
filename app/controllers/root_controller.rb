class RootController < UITableViewController
  FACES = {
    smile: '0x1F600',
    neutral: '0x1F610',
    frown: '0x1F622'
  }
  CELLID = "face"

  def viewDidLoad
    super
    view.dataSource = view.delegate = self
    navigationItem.title = "Pick A Mood"
  end

  # def tableView(tableView, titleForHeaderInSection:section)
  # end

  # def sectionIndexTitlesForTableView(tableView)
  # end

  # def tableView(tableView, sectionForSectionIndexTitle:title, atIndex:index)
  # end

  def tableView(tableView, numberOfRowsInSection:section)
    FACES.keys.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELLID)
      cell.selectionStyle = UITableViewCellSelectionStyleBlue
      cell
    end

    cell.textLabel.text = face_emoji(indexPath.row) + " #{face_name(indexPath.row)}"
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    alert = UIAlertView.alloc.init
    alert.message = "#{face_name(indexPath.row)} tapped!"
    alert.addButtonWithTitle "OK"
    alert.show
  end

  private

  def face(index)
    face = FACES.to_a[index]
  end
  def face_emoji(index)
    face(index)[1].hex.chr(Encoding::UTF_8)
  end
  def face_name(index)
    face(index)[0].capitalize
  end
end
